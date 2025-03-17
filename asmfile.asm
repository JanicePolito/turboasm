ExitProcess PROTO
MessageBoxA PROTO
printf PROTO

.data
myText			db "Hello World from asm file!", 0	; The message in the message box
myCaption		db "Message Box Testing", 0			; The caption of the message box
myValue			QWORD 1234							; The exit code
myString		BYTE "ABCD", 0						; The string to be converted to lowercase
myMessage		db "Hello from ASM file!", 0		; The message to be printed

.code
mboxtest PROC

	sub rsp, 28h		; reserved shadow area

	mov rcx, 0
	lea rdx, myText		; the message in the message box
	lea r8, myCaption	; the caption of the message box
	mov r9, 0
	call MessageBoxA	

	mov rcx, myValue	; the exit code
	call ExitProcess	

mboxtest ENDP

vret PROC
    ; Your assembly code here
    
    mov rax, 42    ; Place return value (42) in RAX
    ret            ; Return to the caller
vret ENDP

lowerCase PROC

	add [myString], 20h		; Convert to lowercase by adding 32 (difference between 'A' and 'a') to first byte
	add [myString+1], 20h	; Convert to lowercase by adding 32 (difference between 'A' and 'a') to second byte
	add [myString+2], 20h
	add [myString+3], 20h
	lea rax, myString		; Load the address of the string into RAX	
	ret						; Return the modified string

lowerCase ENDP

printFromAsm PROC
	lea rcx, [myMessage]		; Load the address of the string into RCX
	sub rsp, 28h			; Allocate space on the stack for the arguments	]
	call printf				; Call the printf function to print the modified string
	add rsp, 28h			; Deallocate the space on the stack
	xor rax, rax			; Clear RAX
	ret						; Return to the caller
printFromAsm ENDP

lowerCaseWithArg PROC
	; RCX contains the address of the string passed from C++
    mov rax, rcx        ; Save the input string address in RAX

	mov dl, [rcx]	; Load the current character into DL
	add dl, 20h		; Convert to lowercase by adding 32 (difference between 'A' and 'a')
	mov [rcx], dl	; Store the lowercase character back
	inc rcx			; Move to the next character
	mov dl, [rcx]
	add dl, 20h
	mov [rcx], dl
	inc rcx
	mov dl, [rcx]
	add dl, 20h
	mov [rcx], dl
	inc rcx
	mov dl, [rcx]
	add dl, 20h
	mov [rcx], dl

	ret				; Return the modified string (pointer is still in RAX)

lowerCaseWithArg ENDP

END