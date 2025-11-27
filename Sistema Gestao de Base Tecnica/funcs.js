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
      const botao = document.getElementById("toggleBtn");

      if (campoSenha.type === "password") {
        campoSenha.type = "text";
        botao.textContent = "Ocultar senha";
      } else {
        campoSenha.type = "password";
        botao.textContent = "Mostrar senha";
      }
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

    function definirIdiomaPadrao(codigoIdioma, nomeIdioma) {
            var texto = document.getElementById("selectedLanguage");
            var bandeira = document.getElementById("countryIcon");

            // Atualiza texto e bandeira
            texto.textContent = nomeIdioma;
            bandeira.className = "adssp-icon-flg-" + codigoIdioma;

            // Adiciona classe de idioma ao body
            document.body.classList.add("lang-" + codigoIdioma);

            // Verifica se é idioma RTL
            if (codigoIdioma === "ar_EG" || codigoIdioma === "iw_IL") {
                document.body.classList.add("body-rtl");
            } else {
                document.body.classList.remove("body-rtl");
            }

            // Oculta spans de outros idiomas
            var elementos;
            if (codigoIdioma !== "ru_RU") {
                elementos = document.querySelectorAll("span.ru_RU-lang");
            } else {
                elementos = document.querySelectorAll("span.en_US-lang");
            }
            for (var i = 0; i < elementos.length; i++) {
                elementos[i].classList.add("hide");
            }
        }

        // Exemplo de uso:
        definirIdiomaPadrao("pt_BR", "Português (Brasil)");
