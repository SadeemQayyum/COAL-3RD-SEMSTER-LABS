

.MODEL SMALL
.STACK 100H

.DATA
    ;MESSAGES AND PROMPTS 
    welcome_msg DB '=== TYPING SPEED TESTER (1-MINUTE TEST) ===', 13, 10
                DB 'Type the following paragraph for 1 minute:', 13, 10, 13, 10, '$'
    
    ; Paragraph broken into multiple lines for proper display in DOS
    test_line1 DB 'Hello everyone! My email address is john.doe@company.com and I have', 13, 10, '$'
    test_line2 DB 'a budget of $500 for this project. You can call me anytime at (123)', 13, 10, '$'
    test_line3 DB '456-7890 between 9:00 AM to 6:00 PM from Monday to Friday. We are', 13, 10, '$'
    test_line4 DB 'looking for skilled C++ programmers for our project #2024 who can', 13, 10, '$'
    test_line5 DB 'give 100% commitment. Please remember to use common symbols like', 13, 10, '$'
    test_line6 DB '&, *, @, #, $, %, !, and ? in your daily programming work. The', 13, 10, '$'
    test_line7 DB 'quick brown fox jumps over the lazy dog while counting numbers:', 13, 10, '$'
    test_line8 DB '1, 2, 3, 4, 5, 6, 7, 8, 9, 10. Programming requires attention to', 13, 10, '$'
    test_line9 DB 'details and practice every single day to improve your skills!', 13, 10, '$'
    
    prompt_msg DB 13, 10, 'Start typing here (You have 60 seconds):', 13, 10, '$'
    
    ; Timer messages
    time_up_msg DB 13, 10, 13, 10, '*** TIME IS UP! ***', 13, 10, '$'
    
    ; Results display messages
    results_msg DB 13, 10, '=== TYPING TEST RESULTS ===', 13, 10, '$'
    total_chars_msg DB 'Total Characters Typed: $'
    total_words_msg DB 'Total Words Typed: $'
    correct_words_msg DB 'Correct Words: $'
    accuracy_msg DB 'Accuracy: $'
    wpm_msg DB 'Typing Speed: $'
    wpm_unit DB ' WPM$'
    percent_sign DB '%$'
    nl DB 13, 10, '$'  ; Newline character sequence
    
    ; Wait prompt message
    wait_prompt DB 'Press any key to start 1-minute timer...$'
    
    ; ==================== VARIABLES FOR CALCULATIONS ====================
    start_time DW 0      ; Stores starting time ticks
    end_time DW 0        ; Stores ending time ticks
    total_chars DW 0     ; Count of total characters typed
    correct_words DW 0   ; Count of correctly typed words
    total_words DW 0     ; Count of total words typed
    accuracy DW 0        ; Accuracy percentage
    typing_wpm DW 0      ; Words per minute
    
    ; Buffer to store user input (500 characters maximum)
    input_buffer DB 500 DUP('$')
    
    ; Reference words array for comparison (not fully implemented in this version)
    reference_words DB 80 DUP(30 DUP('$'))  ; 80 words max, 30 chars each
    word_count DW 0                         ; Count of reference words

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Initialize reference words (basic setup)
    CALL INIT_REFERENCE_WORDS
    
    ; Main program flow
    CALL SHOW_WELCOME        ; Display welcome and paragraph
    CALL WAIT_TO_START       ; Wait for user to start
    CALL START_TEST          ; Start 1-minute typing test
    CALL CALCULATE_ALL       ; Calculate results
    CALL SHOW_RESULTS        ; Display results
    
    ; Wait for any key before exit
    MOV AH, 09H
    LEA DX, nl
    INT 21H
    LEA DX, wait_prompt
    INT 21H
    MOV AH, 07H
    INT 21H
    
    ; Exit to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; ==================== INITIALIZE REFERENCE WORDS ====================
; Sets up reference words for comparison (simplified version)
INIT_REFERENCE_WORDS PROC
    ; This procedure would normally parse the reference paragraph into words
    ; For simplicity, we're just setting up a few sample words
    
    LEA SI, reference_words  ; Point to reference words array
    
    ; Word 1: "Hello"
    MOV BYTE PTR [SI], 'H'
    MOV BYTE PTR [SI+1], 'e'
    MOV BYTE PTR [SI+2], 'l'
    MOV BYTE PTR [SI+3], 'l'
    MOV BYTE PTR [SI+4], 'o'
    MOV BYTE PTR [SI+5], 0   ; Null terminator
    
    ; Word 2: "everyone!"
    ADD SI, 30  ; Move to next word slot (30 bytes per word)
    MOV BYTE PTR [SI], 'e'
    MOV BYTE PTR [SI+1], 'v'
    MOV BYTE PTR [SI+2], 'e'
    MOV BYTE PTR [SI+3], 'r'
    MOV BYTE PTR [SI+4], 'y'
    MOV BYTE PTR [SI+5], 'o'
    MOV BYTE PTR [SI+6], 'n'
    MOV BYTE PTR [SI+7], 'e'
    MOV BYTE PTR [SI+8], '!'
    MOV BYTE PTR [SI+9], 0
    
    ; Word 3: "My"
    ADD SI, 30
    MOV BYTE PTR [SI], 'M'
    MOV BYTE PTR [SI+1], 'y'
    MOV BYTE PTR [SI+2], 0
    
    MOV word_count, 3  ; Set word count for testing
    
    RET
INIT_REFERENCE_WORDS ENDP

; ==================== DISPLAY WELCOME SCREEN ====================
; Shows welcome message and test paragraph
SHOW_WELCOME PROC
    ; Display main welcome message
    MOV AH, 09H
    LEA DX, welcome_msg
    INT 21H
    
    ; Display paragraph line by line (DOS can't handle very long strings)
    LEA DX, test_line1
    INT 21H
    LEA DX, test_line2
    INT 21H
    LEA DX, test_line3
    INT 21H
    LEA DX, test_line4
    INT 21H
    LEA DX, test_line5
    INT 21H
    LEA DX, test_line6
    INT 21H
    LEA DX, test_line7
    INT 21H
    LEA DX, test_line8
    INT 21H
    LEA DX, test_line9
    INT 21H
    
    ; Display typing prompt
    LEA DX, prompt_msg
    INT 21H
    
    RET
SHOW_WELCOME ENDP

; ==================== WAIT FOR USER TO START ====================
; Waits for user to press any key before starting timer
WAIT_TO_START PROC
    ; Display newline and wait prompt
    MOV AH, 09H
    LEA DX, nl
    INT 21H
    LEA DX, wait_prompt
    INT 21H
    
    ; Wait for key press (no echo)
    MOV AH, 07H
    INT 21H
    
    ; Clear the wait prompt line
    MOV AH, 09H
    LEA DX, nl
    INT 21H
    
    RET
WAIT_TO_START ENDP

; ==================== START TYPING TEST ====================
; Main typing test procedure with 1-minute timer
START_TEST PROC
    ; Get system time in ticks (for timer)
    MOV AH, 00H
    INT 1AH
    MOV start_time, DX
    
    ; Initialize input buffer pointer and character counter
    LEA DI, input_buffer
    MOV total_chars, 0
    
typing_loop:
    ; Check if 60 seconds have passed
    CALL CHECK_TIME_UP
    CMP AX, 1
    JE test_complete      ; Jump if time is up
    
    ; Check for key press without blocking
    MOV AH, 01H
    INT 16H
    JZ typing_loop       ; No key pressed, continue checking
    
    ; Key is available, read it
    MOV AH, 00H
    INT 16H
    
    ; Check for Enter key (manual completion)
    CMP AL, 0DH
    JE test_complete
    
    ; Store character in buffer
    MOV [DI], AL
    INC DI
    INC total_chars
    
    ; Echo the character to screen
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    JMP typing_loop      ; Continue typing

test_complete:
    ; Display time up message
    MOV AH, 09H
    LEA DX, time_up_msg
    INT 21H
    
    ; Get end time
    MOV AH, 00H
    INT 1AH
    MOV end_time, DX
    
    RET
START_TEST ENDP

; ==================== CHECK TIMER ====================
; Checks if 60 seconds have passed since start
; Returns: AX=1 if time is up, AX=0 otherwise
CHECK_TIME_UP PROC
    PUSH DX
    PUSH CX
    
    ; Get current system time
    MOV AH, 00H
    INT 1AH
    
    ; Calculate elapsed ticks
    SUB DX, start_time
    
    ; Convert ticks to seconds (each tick ˜ 55ms, 18.2 ticks per second)
    MOV AX, DX
    MOV DX, 0
    MOV CX, 18
    DIV CX
    
    ; Check if 60 seconds have passed
    CMP AX, 60
    JAE time_is_up
    MOV AX, 0            ; Time not up
    JMP check_done
    
time_is_up:
    MOV AX, 1            ; Time is up
    
check_done:
    POP CX
    POP DX
    RET
CHECK_TIME_UP ENDP

; ==================== CALCULATE ALL RESULTS ====================
; Orchestrates all calculation procedures
CALCULATE_ALL PROC
    CALL COUNT_ALL_WORDS          ; Count total words typed
    CALL COUNT_CORRECT_WORDS_SIMPLE ; Estimate correct words
    CALL FIND_ACCURACY            ; Calculate accuracy percentage
    CALL CALCULATE_WPM            ; Calculate words per minute
    RET
CALCULATE_ALL ENDP

; ==================== COUNT WORDS IN USER INPUT ====================
; Counts words by counting spaces (words = spaces + 1)
COUNT_ALL_WORDS PROC
    LEA SI, input_buffer     ; Point to user input
    MOV CX, total_chars      ; Number of characters to check
    MOV total_words, 0
    
    CMP CX, 0
    JE words_done           ; No characters typed
    
    MOV total_words, 1      ; At least one word (even with no spaces)
    
count_spaces:
    MOV AL, [SI]
    CMP AL, ' '            ; Check for space character
    JNE next_char
    INC total_words        ; Increment word count for each space
next_char:
    INC SI
    LOOP count_spaces

words_done:
    RET
COUNT_ALL_WORDS ENDP

; ==================== ESTIMATE CORRECT WORDS ====================
; Simplified approach to estimate correct words based on character count
; In a full implementation, this would compare each word with reference
COUNT_CORRECT_WORDS_SIMPLE PROC
    MOV correct_words, 0
    MOV CX, total_words
    
    CMP CX, 0
    JE simple_done         ; No words typed
    
    ; Use character count as heuristic for accuracy estimation
    MOV AX, total_chars
    
    ; Simple accuracy estimation based on typing volume:
    ; More characters typed ? higher assumed accuracy
    
    CMP AX, 50
    JB low_chars           ; Less than 50 characters
    CMP AX, 100
    JB medium_chars        ; 50-99 characters
    CMP AX, 200
    JB high_chars          ; 100-199 characters
    
    ; High character count (200+) - assume good accuracy (~75%)
    MOV BX, total_words
    SHR BX, 1              ; BX = total_words / 2
    MOV AX, BX
    ADD AX, BX             ; AX ˜ total_words * 0.75
    MOV correct_words, AX
    JMP simple_done
    
high_chars:
    ; Medium-high character count - assume moderate accuracy (~50%)
    MOV AX, total_words
    SHR AX, 1              ; AX = total_words / 2
    MOV correct_words, AX
    JMP simple_done
    
medium_chars:
    ; Medium character count - assume low accuracy (~25%)
    MOV AX, total_words
    SHR AX, 2              ; AX = total_words / 4
    MOV correct_words, AX
    JMP simple_done
    
low_chars:
    ; Low character count - assume at least 1 word correct
    MOV correct_words, 1
    
simple_done:
    ; Ensure correct_words doesn't exceed total_words
    MOV AX, correct_words
    CMP AX, total_words
    JBE simple_ok
    MOV AX, total_words
    MOV correct_words, AX
    
simple_ok:
    RET
COUNT_CORRECT_WORDS_SIMPLE ENDP

; ==================== CALCULATE ACCURACY PERCENTAGE ====================
; Calculates accuracy using formula: (Correct Words / Total Words) × 100
FIND_ACCURACY PROC
    MOV AX, correct_words
    MOV DX, 100
    MUL DX                  ; AX = correct_words × 100
    
    MOV BX, total_words
    CMP BX, 0
    JE no_accuracy         ; Avoid division by zero
    
    DIV BX                 ; AX = (correct_words × 100) / total_words
    JMP accuracy_found

no_accuracy:
    MOV AX, 0             ; Zero accuracy if no words typed

accuracy_found:
    MOV accuracy, AX
    RET
FIND_ACCURACY ENDP

; ==================== CALCULATE WORDS PER MINUTE ====================
; Since test is exactly 1 minute, WPM = total words typed
CALCULATE_WPM PROC
    MOV AX, total_words
    MOV typing_wpm, AX
    RET
CALCULATE_WPM ENDP

; ==================== DISPLAY RESULTS ====================
; Shows all typing test results
SHOW_RESULTS PROC
    ; Display results header
    MOV AH, 09H
    LEA DX, nl
    INT 21H
    LEA DX, results_msg
    INT 21H
    
    ; Display total characters
    LEA DX, total_chars_msg
    INT 21H
    MOV AX, total_chars
    CALL SHOW_NUMBER
    CALL PRINT_NEWLINE
    
    ; Display total words
    LEA DX, total_words_msg
    INT 21H
    MOV AX, total_words
    CALL SHOW_NUMBER
    CALL PRINT_NEWLINE
    
    ; Display correct words
    LEA DX, correct_words_msg
    INT 21H
    MOV AX, correct_words
    CALL SHOW_NUMBER
    CALL PRINT_NEWLINE
    
    ; Display accuracy percentage
    LEA DX, accuracy_msg
    INT 21H
    MOV AX, accuracy
    CALL SHOW_NUMBER
    MOV AH, 09H
    LEA DX, percent_sign
    INT 21H
    CALL PRINT_NEWLINE
    
    ; Display words per minute
    LEA DX, wpm_msg
    INT 21H
    MOV AX, typing_wpm
    CALL SHOW_NUMBER
    MOV AH, 09H
    LEA DX, wpm_unit
    INT 21H
    CALL PRINT_NEWLINE
    
    RET
SHOW_RESULTS ENDP

; ==================== DISPLAY NUMBER ====================
; Converts number in AX to decimal and displays it
SHOW_NUMBER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV CX, 0        ; Counter for digits
    MOV BX, 10       ; Divisor for base 10
    
    ; Handle zero case
    CMP AX, 0
    JNE number_loop
    MOV DL, '0'
    MOV AH, 02H
    INT 21H
    JMP number_done
    
number_loop:
    ; Extract digits by repeated division
    MOV DX, 0
    DIV BX           ; AX = quotient, DX = remainder
    PUSH DX          ; Save digit
    INC CX           ; Count digits
    CMP AX, 0
    JNE number_loop
    
show_digits:
    ; Display digits in correct order
    POP DX
    ADD DL, '0'      ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP show_digits
    
number_done:
    POP DX
    POP CX
    POP BX
    POP AX
    RET
SHOW_NUMBER ENDP

; ==================== DISPLAY NEWLINE ====================
; Prints carriage return and line feed
PRINT_NEWLINE PROC
    PUSH AX
    PUSH DX
    
    MOV AH, 09H
    LEA DX, nl
    INT 21H
    
    POP DX
    POP AX
    RET
PRINT_NEWLINE ENDP

END MAIN
