// Melhorias aplicadas:
//- ✅ React Hooks (useState, useEffect) para dark mode e relógio dinâmico.
//- ✅ Substituí <marquee> por um texto animado via CSS (mais moderno e acessível).
//- ✅ Componentização: App organiza tudo em seções (header, login, footer).
//- ✅ onSubmit com validação simples no login.
//- ✅ className em vez de style inline (melhor manutenção).
//- ✅ rel="noopener noreferrer" em links externos (boa prática de segurança).

//👉 Quer que eu quebre esse código em componentes menores (ex: LoginForm, LanguageSelector, DarkModeToggle) para ficar ainda mais modular? 

//Estrutura sugerida
//src/
 //├─ //components/
 //│   ├─ DarkModeToggle.jsx
// │   ├─ LanguageSelector.jsx
 //│   ├─ LoginForm.jsx
// │   ├─ Clock.jsx
// │   └─ ScrollMessage.jsx
// └─ App.jsx



//🔹 DarkModeToggle.jsx

import React from "react";

export default function DarkModeToggle({ darkMode, toggleDarkMode }) {
  return (
    <button onClick={toggleDarkMode} className="dark-mode-toggle">
      🌙 {darkMode ? "Modo Claro" : "Modo Escuro"}
    </button>
  );
}



//🔹 LanguageSelector.jsx

import React from "react";

export default function LanguageSelector({ onChange }) {
  return (
    <select
      id="languageSelect"
      className="language-select"
      onChange={(e) => onChange(e.target.value)}
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
  );
}



//🔹 LoginForm.jsx

import React from "react";

export default function LoginForm({ onSubmit }) {
  return (
    <form className="loginForm" onSubmit={onSubmit}>
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
  );
}



//🔹 Clock.jsx

import React, { useState, useEffect } from "react";

export default function Clock() {
  const [time, setTime] = useState(new Date().toLocaleTimeString());

  useEffect(() => {
    const timer = setInterval(() => {
      setTime(new Date().toLocaleTimeString());
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  return <div id="clock">{time}</div>;
}



//🔹 ScrollMessage.jsx

import React from "react";

export default function ScrollMessage() {
  return (
    <div className="scroll-message">
      <p>
        Bem-vindo à sua central de informações. Explore os tópicos e aprenda
        mais!
      </p>
    </div>
  );
}



//🔹 App.jsx

import React, { useState } from "react";
import DarkModeToggle from "./components/DarkModeToggle";
import LanguageSelector from "./components/LanguageSelector";
import LoginForm from "./components/LoginForm";
import Clock from "./components/Clock";
import ScrollMessage from "./components/ScrollMessage";
import "./style.css";
import "./style2.css";
import "./Style_index.css";

export default function App() {
  const [darkMode, setDarkMode] = useState(false);

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
    console.log("Usuário:", user, "Senha:", senha);
  };

  return (
    <div className={`app ${darkMode ? "dark-mode" : ""}`}>
      <img src="logo2.jpg" alt="Logo do sistema" className="background-image" />

      <ScrollMessage />

      <section className="conteudo">
        <header className="top-bar">
          <DarkModeToggle darkMode={darkMode} toggleDarkMode={toggleDarkMode} />
          <LanguageSelector onChange={(lang) => console.log("Idioma:", lang)} />
        </header>

        <div className="login-section">
          <div className="logo-login">
            <img src="logo.png" alt="Logo" />
          </div>
          <LoginForm onSubmit={handleLogin} />
        </div>

        <footer className="footer">
          <Clock />
        </footer>

        <div className="container">
          <h1 className="titulo-centralizado">📚 BASE DE CONHECIMENTO</h1>
        </div>
      </section>
    </div>
  );
}





