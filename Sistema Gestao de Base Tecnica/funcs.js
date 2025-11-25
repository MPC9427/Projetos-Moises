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

    function setDefaultLanguage()
        {
            var textElement = document.getElementById("selectedLanguage");
            var flagElement = document.getElementById("countryIcon");
            textElement.textContent = "Português (Brasil)";
            flagElement.className = "adssp-icon-flg-"+"pt_BR";
            document.body.classList.add("lang-"+"pt_BR"); 
            if("ar_EG" == "pt_BR" || "iw_IL" ==  "pt_BR")
            {
                document.body.classList.add('body-rtl'); 
            }
            else
            {
                document.body.classList.remove('body-rtl'); 
            }
            
            var elements;
            if("ru_RU" != "pt_BR")
            {
                elements = document.querySelectorAll("span.ru_RU-lang"); 
            }
            else
            {
                elements = document.querySelectorAll("span.en_US-lang"); 
            }
            for (var i = 0; i < elements.length; i++) {
                elements[i].classList.add("hide");
            }
        }