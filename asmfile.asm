ExitProcess PROTO
MessageBoxA PROTO

.data
myText			db "Hello World from asm file!", 0
myCaption		db "Message Box Testing", 0
myValue			QWORD 1234
myString		BYTE "ABCD", 0

.code
mboxtest PROC

	;sub rsp, 28h   ;reserved the stack area as parameter passing area
	;mov rcx, 12345678   ; specify Exit Code
	;call ExitProcess

	sub rsp, 28h		; reserved shadow area

	mov rcx, 0
	lea rdx, myText
	lea r8, myCaption
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

	add [myString], 20h
	add [myString+1], 20h
	add [myString+2], 20h
	add [myString+3], 20h
	lea rax, myString
	ret

lowerCase ENDP

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