import { useState } from 'react';
import {  fetchLogout } from './services';
import Navigation from './Navigation';

import Login from './Login';
import Footer from './Footer';


import './App.css';

function App() {
  const [userState, setUserState] = useState({
    isLoggedIn: false,
    loading: true,
    
  });

  // const handleTigerText = function () {

  // }

 

  const logout = function () {
    
    setUserState({
      ...userState,
      loading: true,
    });
    fetchLogout()
      .then(() => {
        setUserState({
          isLoggedIn: false,
          loading: false,
        });
      })
      .catch((err) => {

        setUserState({
          ...userState,
          loading: false,
        });
      });
  };



  //
  return (
    <div className="app">
      {!userState.isLoggedIn && <Login setUserState={setUserState} />}
      {userState.isLoggedIn && <Navigation onLogout={logout} 
      // handleTigerText={handleTigerText}
       />
      }
      {userState.isLoggedIn && <Footer />}



    </div>

  );
}

export default App;