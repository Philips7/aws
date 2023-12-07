import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import {useTranslation} from "react-i18next";
import {Card} from "./Card.tsx";

function App() {
  const [count, setCount] = useState(0)

    const { t,  } = useTranslation();
    document.title = t("title");


    const changeLng = () => {
        document.title = "change lng"
    }


    console.log(t("title"));


  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
          <button onClick={changeLng}>DASDA</button>
        <p>
            <Card/>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
          {t('title')}
      </p>
    </>
  )
}

export default App
