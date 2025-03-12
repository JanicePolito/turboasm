ExitProcess PROTO
MessageBoxA PROTO

.data
myText			db "Hello World from asm file!", 0
myCaption		db "Message Box Testing", 0
myValue			QWORD 1234

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

END