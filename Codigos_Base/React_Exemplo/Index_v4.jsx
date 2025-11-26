import React, { useState, useEffect } from "react";
import "./style.css";
import "./style2.css";
import "./Style_index.css";

export default function App() {
  const [darkMode, setDarkMode] = useState(false);
  const [clock, setClock] = useState(new Date().toLocaleTimeString());

  useEffect(() => {
    const timer = setInterval(() => {
      setClock(new Date().toLocaleTimeString());
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
    document.body.classList.toggle("dark-mode", !darkMode);
  };

  const handleLogin = (e) => {
    e.preventDefault();
    const form = e.target;
    const user = form.usu.value;
    const senha = form.senha.value;

    if (!user || !senha) {
      alert("Obrigatório usuário e senha!");
      return;
    }
    // Aqui você pode integrar com backend
    console.log("Usuário:", user, "Senha:", senha);
  };

  return (
    <div className={`app ${darkMode ? "dark-mode" : ""}`}>
      {/* Background */}
      <img
        src="logo2.jpg"
        alt="Logo do sistema"
        className="background-image"
      />

      {/* Mensagem rolante */}
      <div className="scroll-message">
        <p>
          Bem-vindo à sua central de informações. Explore os tópicos e aprenda
          mais!
        </p>
      </div>

      {/* Conteúdo principal */}
      <section className="conteudo">
        <header className="top-bar">
          <button onClick={toggleDarkMode} className="dark-mode-toggle">
            🌙 {darkMode ? "Modo Claro" : "Modo Escuro"}
          </button>

          <select
            id="languageSelect"
            className="language-select"
            onChange={(e) => console.log("Idioma:", e.target.value)}
            defaultValue="pt_BR"
          >
            <option value="--_--">Navegador padrão</option>
            <option value="en_US">English</option>
            <option value="ja_JP">日本語</option>
            <option value="zh_CN">Chinês - Simplificado</option>
            <option value="es_MX">Español</option>
            <option value="de_DE">Deutsch</option>
            <option value="pl_PL">Polski</option>
            <option value="pt_BR">Português (Brasil)</option>
            <option value="fr_FR">Français</option>
            <option value="tr_TR">Türkçe</option>
            <option value="it_IT">Italiano</option>
            <option value="ru_RU">Русский</option>
            <option value="ko_KR">한국어</option>
            <option value="zh_TW">Chinês - Tradicional</option>
          </select>
        </header>

        {/* Login */}
        <div className="login-section">
          <div className="logo-login">
            <img src="logo.png" alt="Logo" />
          </div>

          <form className="loginForm" onSubmit={handleLogin}>
            <div className="infos">
              <input
                type="text"
                name="usu"
                placeholder="Usuário"
                required
                pattern="[a-z.]*"
                autoComplete="on"
              />
            </div>
            <div className="infos">
              <input
                type="password"
                name="senha"
                placeholder="Senha"
                required
                autoComplete="off"
              />
            </div>
            <button className="bt-login" type="submit">
              Entrar
            </button>

            <div className="msg_alerta">Obrigatório usuário e senha!</div>

            <a
              href="https://wa.me/5511999999999"
              target="_blank"
              rel="noopener noreferrer"
            >
              💬 Fale conosco no WhatsApp!
            </a>
          </form>
        </div>

        {/* Rodapé */}
        <footer className="footer">
          <div id="clock">{clock}</div>
        </footer>

        {/* Base de conhecimento */}
        <div className="container">
          <h1 className="titulo-centralizado">📚 BASE DE CONHECIMENTO</h1>
        </div>
      </section>
    </div>
  );
}
