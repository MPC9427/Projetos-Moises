    function valida() {
        if (form['usu'].value == "") {
            confirm("O campo USUARIO e obrigatorio");
            form['usu'].focus();
            return false
        }
        if (form['senha'].value == "") {
            alert("O campo SENHA e obrigatorio");
            form['senha'].focus();
            return false
        }
    }


    const botao = document.getElementById("toggleDarkMode");

      botao.addEventListener("click", function () {
       document.body.classList.toggle("dark-mode");

             // Alterna o texto do botão
      if (document.body.classList.contains("dark-mode")) {
      botao.textContent = "☀️ Modo Claro";
       } else {
      botao.textContent = "🌙 Modo Escuro";
               }
        });
									
 
    function updateTime() {
	    var now = new Date();
		var hours = now.getHours().toString().padStart(2, '0');
		var minutes = now.getMinutes().toString().padStart(2, '0');
		var seconds = now.getSeconds().toString().padStart(2, '0');
		var timeString = hours + ':' + minutes + ':' + seconds;
		document.getElementById('clock').textContent = timeString;
				}
			setInterval(updateTime, 1000);
			updateTime();

    function alternarSenha() {
		const campoSenha = document.getElementById("senha");
		campoSenha.type = campoSenha.type === "password" ? "text" : "password";
			}


    function recuperarSenha(email) {
		sendPasswordResetEmail(auth, email)
		.then(() => alert("Email de recuperação enviado!"))
		.catch((error) => alert("Erro: " + error.message));
			
				}

    function valida() {
		const usu = document.form.usu.value.trim();
		const senha = document.form.senha.value.trim();
		const alerta = document.querySelector('.msg_alerta');

			if (!usu || !senha) {
				alerta.style.display = 'block';
				return false;
                
				}

				alerta.style.display = 'none';
				return true;

				}