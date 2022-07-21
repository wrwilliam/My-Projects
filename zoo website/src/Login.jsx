import { useState } from 'react';
import { fetchLoginPost } from './services';
import './Login.css';

import Slider from "./Slider"
const Login = function ({ onLogin, setUserState }) {
  const [username, setUsername] = useState('');
  const [noShow, setNoShow] = useState(true);
  const [loading, setloading] = useState(false);
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');

  const onChange = (e) => {
    setUsername(e.target.value);
    setNoShow(!e.target.value);
  };

  const login = () => {
    setloading(true);
    fetchLoginPost({ username })
      .then(userinfo => {
        setUserState({
          isLoggedIn: true,
          loading: false
        })
        setStatus('');
        setloading(false);
        onLogin({ username, info: userinfo.info });
        // console.log(userinfo)
        setError('');
      })
      .catch(err => {
        setStatus('error,404');
        if (err.error === "dog_is_not_a_useranme") {
          setError('Username cannot be dog.');
          setloading(false);
return;
      }
     
        setError('you need input username before login');
        setloading(false);
        
      });
  };
// no_inputting
  return (
    <div className="header">
     
      <h1>WELCOME TO SUPER ZOO</h1>
      {status && <div class="status">{status}</div>}
      <label>
        Username:
        <input className='users' placeholder="username is required" disabled={loading} onChange={onChange} value={username} 
        required/>
      </label>
     <div>
     <button onClick={login} disabled={noShow || loading} >{loading ? "..." : "Login"}</button>

     {error && <p className="errorMsg">{error}</p>}
     </div>
     <div className='descriptions'>
<p className='loginWord'> Our zoo have many famous star animals, they are very cute, would you like play with them...
Though people have kept wild animals for thousands of years, those collections have not always resembled modern zoos. The first zoos were created as private collections by the wealthy to show their power. These private collections were called menageries.
</p>
</div>
      <Slider />
    </div>
  
  );
};
export default Login;