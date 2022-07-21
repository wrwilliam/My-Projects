
import { useState, useEffect } from 'react';
import { fetchCommentGet, fetchCommentPost } from './services';
import CommentShow from "./CommentShow";
import './CommentShow.css';

const CommentPage = () => {

  const [messageList, setMessageList] = useState([]);
  const [error, setError] = useState('');
  const [description, setdescription] = useState('');


  useEffect(() => {
    fetchCommentGet()
      .then(info => {
       
        setMessageList(info);
      }).catch((e) => { console.log(e); 
        setError(e.error);
      })
  
  }, []);



  function addNewMessage() {
    fetchCommentPost(description)
      .then((inputing) => {
        console.log(inputing)
        setMessageList(inputing);
        setError('')
        setdescription('');
      }).catch(err => {
            if (err.error === "no_text") {
              setError('you need input something before submit.');
              return;
          }

setError('something wrong');
     
        })
  }





  return (
    <ul className="inputBox">


      <div className="outgoing">
      <div className='mytitle'>
      <h1>Comment Area, write anything...</h1>
        </div>
        <textarea
placeholder="writing something..."
          id="inputcomments" name="inputcomments" rows="6" cols="50"
          onChange={(e) => setdescription(e.target.value)} value={description}></textarea>
        <div className='comments_btn'><button  onClick={addNewMessage} >submit</button></div>
        {error && <p className="errorMsg">{error}</p>}

        <CommentShow messageList={messageList} />

      </div>
    </ul>
  )
}

export default CommentPage;

