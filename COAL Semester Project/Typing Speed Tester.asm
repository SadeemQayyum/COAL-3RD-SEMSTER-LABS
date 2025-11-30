; ============================================================
;  TYPING SPEED TESTER - FINAL VERSION WITH REALISTIC ACCURACY
;  FULLY COMMENTED FOR EASY UNDERSTANDING
; ============================================================

.MODEL SMALL
.STACK 100H

.DATA

; Welcome + instructions
welcome_msg DB '=== TYPING SPEED TESTER (1-MINUTE TEST) ===',13,10
            DB 'Type the following paragraph for 1 minute:',13,10,13,10,'$'

; Paragraph shown to user
test_line1  DB 'Hello everyone! My email address is john.doe@company.com and I have',13,10,'$'
test_line2  DB 'a budget of 456-7890 between 9:00 AM to 6:00 PM from Monday to Friday.',13,10,'$'

prompt_msg  DB 13,10,'Start typing here (You have 60 seconds):',13,10,'$'
time_up_msg DB 13,10,13,10,'*** TIME IS UP! ***',13,10,'$'

results_msg DB 13,10,'=== TYPING TEST RESULTS ===',13,10,'$'

; Display labels
total_chars_msg DB 'Total Characters Typed: $'
accuracy_msg    DB 'Accuracy: $'
wpm_msg         DB 'Typing Speed: $'
wpm_unit        DB ' WPM$'
percent_sign    DB '%$'

nl DB 13,10,'$'
wait_prompt DB 'Press any key to start 1-minute timer...$'

; Variables
start_time DW 0
end_time   DW 0

total_chars   DW 0         ; number of characters typed
total_words   DW 0         ; number of words typed
correct_words DW 0         ; number of correct typed words
accuracy      DW 0         ; accuracy %
typing_wpm    DW 0         ; WPM

; Buffers
input_buffer DB 500 DUP(0)       ; user typed text
reference_words DB 80*30 DUP(0)  ; 80 words × 30 bytes each
word_count DW 0                  ; number of reference words

; The whole paragraph (used for reference parsing)
paragraph DB "Hello everyone! My email address is john.doe@company.com and I have a budget of 456-7890 between 9:00 AM to 6:00 PM from Monday to Friday.",0


; ============================================================
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX                ; Load data segment

    CALL PARSE_REFERENCE_WORDS   ; Convert paragraph to word list
    CALL SHOW_WELCOME            ; Show instructions
    CALL WAIT_TO_START           ; Wait key press
    CALL START_TEST              ; Record typing for 1 minute
    CALL CALCULATE_ALL           ; Compute accuracy, WPM, etc.
    CALL SHOW_RESULTS            ; Display results

    ; Wait before exit
    MOV AH,09H
    LEA DX,wait_prompt
    INT 21H

    MOV AH,07H
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP


; ============================================================
; PARSE PARAGRAPH INTO REFERENCE WORD LIST
; ============================================================
PARSE_REFERENCE_WORDS PROC
    LEA SI,paragraph
    LEA DI,reference_words
    XOR BX,BX                 ; BX = word count

p2_next:
    MOV AL,[SI]
    CMP AL,0                 ; end of paragraph
    JE p2_done

    CMP AL,' '               ; skip spaces
    JE p2_skip

    ; -------- start of a word --------
    PUSH DI                 ; Save this word start

p2_copy:
    MOV AL,[SI]
    CMP AL,0
    JE p2_finish
    CMP AL,' '              ; word ends on space
    JE p2_finish

    MOV [DI],AL             ; store character
    INC DI
    INC SI
    JMP p2_copy

p2_finish:
    MOV BYTE PTR [DI],0     ; null terminate word
    POP DI                  ; restore pointer
    ADD DI,30               ; jump to next word slot
    INC BX                  ; increase word count

p2_skip:
    INC SI
    JMP p2_next

p2_done:
    MOV word_count,BX
    RET
PARSE_REFERENCE_WORDS ENDP


; ============================================================
SHOW_WELCOME PROC
    MOV AH,09H
    LEA DX,welcome_msg
    INT 21H
    LEA DX,test_line1
    INT 21H
    LEA DX,test_line2
    INT 21H
    LEA DX,prompt_msg
    INT 21H
    RET
SHOW_WELCOME ENDP


; ============================================================
WAIT_TO_START PROC
    MOV AH,07H     ; wait for any key
    INT 21H
    RET
WAIT_TO_START ENDP


; ============================================================
; START TYPING (capture 60 seconds)
; ============================================================
START_TEST PROC
    MOV AH,00H
    INT 1AH
    MOV start_time,DX          ; save start tick

    LEA DI,input_buffer
    MOV total_chars,0

t2_loop:
    CALL CHECK_TIME_UP
    CMP AX,1
    JE t2_done

    MOV AH,01H                ; key available?
    INT 16H
    JZ t2_loop

    MOV AH,00H
    INT 16H                   ; Read char to AL

    ; Filter unwanted keys
    CMP AL,0Dh
    JE t2_done
    CMP AL,0Ah
    JE t2_loop
    CMP AL,09h
    JE t2_loop
    CMP AL,32
    JB t2_loop
    CMP AL,126
    JA t2_loop

    MOV [DI],AL               ; store char
    INC DI
    INC total_chars

    MOV DL,AL                 ; echo typed char
    MOV AH,02H
    INT 21H

    JMP t2_loop

t2_done:
    MOV AH,09H
    LEA DX,time_up_msg
    INT 21H
    RET
START_TEST ENDP


; ============================================================
; CHECK IF 60 SECONDS PASSED
; ============================================================
CHECK_TIME_UP PROC
    MOV AH,00H
    INT 1AH
    SUB DX,start_time
    MOV AX,DX
    MOV CX,18            ; 18 ticks ˜ 1 sec
    MOV DX,0
    DIV CX
    CMP AX,60
    JAE c2_up
    MOV AX,0
    RET
c2_up:
    MOV AX,1
    RET
CHECK_TIME_UP ENDP


; ============================================================
; COUNT HOW MANY WORDS USER TYPED
; ============================================================
COUNT_TYPED_WORDS PROC
    LEA SI,input_buffer
    MOV CX,total_chars
    CMP CX,0
    JE ct_zero

    MOV total_words,1    ; at least one word

ct_loop:
    MOV AL,[SI]
    CMP AL,' '
    JNE ct_next
    INC total_words
ct_next:
    INC SI
    LOOP ct_loop
    RET

ct_zero:
    MOV total_words,0
    RET
COUNT_TYPED_WORDS ENDP




; ============================================================
; REALISTIC ACCURACY MATCHING
; typed[i] vs reference[i]
; ============================================================
COUNT_REALISTIC_CORRECT PROC
    MOV correct_words,0
    MOV AX,total_words
    CMP AX,0
    JE crc_done

    LEA SI,input_buffer
    LEA DI,reference_words
    MOV CX,total_words        ; compare same number of words

crc_next_word:
    CMP CX,0
    JE crc_done

; Skip spaces before a word
crc_skip_lead:
    MOV AL,[SI]
    CMP AL,' '
    JE crc_inc_si
    CMP AL,0
    JE crc_done
    JMP crc_start_compare

crc_inc_si:
    INC SI
    JMP crc_skip_lead

; Compare characters of the typed word and reference word
crc_start_compare:
    PUSH SI
    PUSH DI

crc_cmp_loop:
    MOV AL,[SI]
    MOV DL,[DI]

    CMP DL,0
    JE crc_end_compare   ; reference word ended

    CMP AL,' '
    JE crc_mismatch
    CMP AL,0
    JE crc_mismatch

    CMP AL,DL
    JNE crc_mismatch     ; mismatch

    INC SI
    INC DI
    JMP crc_cmp_loop

crc_end_compare:
    ; typed must also be at end of word
    CMP AL,' '
    JE crc_correct
    CMP AL,0
    JE crc_correct
    JMP crc_mismatch

crc_correct:
    INC correct_words
    POP DI
    POP SI
    JMP crc_skip_rest

crc_mismatch:
    POP DI
    POP SI

; Skip to next typed word
crc_skip_rest:
crc_skip_word:
    MOV AL,[SI]
    CMP AL,' '
    JE crc_to_next
    CMP AL,0
    JE crc_done
    INC SI
    JMP crc_skip_word

crc_to_next:
    INC SI
    ADD DI,30
    DEC CX
    JMP crc_next_word

crc_done:
    RET
COUNT_REALISTIC_CORRECT ENDP




; ============================================================
FIND_ACCURACY PROC
    MOV AX,correct_words
    MOV BX,total_words
    CMP BX,0
    JE acc_zero

    MOV DX,0
    MOV CX,100
    MUL CX
    DIV BX
    MOV accuracy,AX
    RET

acc_zero:
    MOV accuracy,0
    RET
FIND_ACCURACY ENDP


; ============================================================
CALCULATE_WPM PROC
    MOV AX,total_words
    MOV typing_wpm,AX      ; WPM = words in 1 minute
    RET
CALCULATE_WPM ENDP


; ============================================================
CALCULATE_ALL PROC
    CALL COUNT_TYPED_WORDS
    CALL COUNT_REALISTIC_CORRECT
    CALL FIND_ACCURACY
    CALL CALCULATE_WPM
    RET
CALCULATE_ALL ENDP


; ============================================================
SHOW_RESULTS PROC
    MOV AH,09H
    LEA DX,results_msg
    INT 21H

    ; Total characters
    LEA DX,total_chars_msg
    INT 21H
    MOV AX,total_chars
    CALL SHOW_NUM
    CALL NL_PRINT

    ; Accuracy
    LEA DX,accuracy_msg
    INT 21H
    MOV AX,accuracy
    CALL SHOW_NUM
    MOV AH,09H
    LEA DX,percent_sign
    INT 21H
    CALL NL_PRINT

    ; WPM
    LEA DX,wpm_msg
    INT 21H
    MOV AX,typing_wpm
    CALL SHOW_NUM
    MOV AH,09H
    LEA DX,wpm_unit
    INT 21H
    CALL NL_PRINT

    RET
SHOW_RESULTS ENDP


; ============================================================
; PRINT NUMBER IN AX
; ============================================================
SHOW_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    CMP AX,0
    JNE sn1
    MOV DL,'0'
    MOV AH,02H
    INT 21H
    JMP sn_done

sn1:
    XOR CX,CX
    MOV BX,10

sn_l1:
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX,0
    JNE sn_l1

sn_l2:
    POP DX
    ADD DL,'0'
    MOV AH,02H
    INT 21H
    LOOP sn_l2

sn_done:
    POP DX
    POP CX
    POP BX
    POP AX
    RET
SHOW_NUM ENDP


; ============================================================
; PRINT NEW LINE
; ============================================================
NL_PRINT PROC
    MOV AH,09H
    LEA DX,nl
    INT 21H
    RET
NL_PRINT ENDP


END MAIN
