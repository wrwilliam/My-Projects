import {fetchLogout, fetchCommentGet,  fetchgettiger, fetchgetpanda, fetchgetkoala, fetchgetkangaroo } from './services';
import { useState } from 'react';
import CommentPage from "./CommentPage"
import PandaBody from "./PandaBody";
import KoalaBody from "./KoalaBody";
import KangarooBody from "./KangarooBody";
import TigerBody from "./TigerBody"
import './Navigation.css';

const Navigation = ({ onLogout, handleTigerText }) => {
  const [comment, setcomment] = useState(true)
  const [tigerComing, setTigerComing] = useState(false)
  const [pandaComing, setPandaComing] = useState(false)
  const [koalaComing, setKoalaComing] = useState(false)
  const [kangarooComing, setKangarooComing] = useState(false)
  const [Textcontent, setTextContent] = useState("");


  function commentshowclick() {

    setcomment(true)
    setTigerComing(false);
    setPandaComing(false);
    setKoalaComing(false);
    setKangarooComing(false);

    fetchCommentGet().then((text) => { setTextContent(text) });
  }
  function tigershowclick() {
    setTigerComing(true);
    setPandaComing(false);
    setcomment(false)
    setKoalaComing(false);
    setKangarooComing(false);
    fetchgettiger().then((text) => { setTextContent(text) });
  }
  function pandashowclick() {
    setTigerComing(false)
    setPandaComing(true)
    setKoalaComing(false)
    setKangarooComing(false)  //
    setcomment(false);
    fetchgetpanda().then((text) => { setTextContent(text) });
  }
  function kaolashowclick() {
    setTigerComing(false)
    setPandaComing(false)
    setKoalaComing(true)
    setKangarooComing(false)
    setcomment(false)
    fetchgetkoala().then((text) => { setTextContent(text) });
  }
  function kangarooshowclick() {
    setTigerComing(false)
    setPandaComing(false)
    setKoalaComing(false)
    setKangarooComing(true)
    setcomment(false)
    fetchgetkangaroo().then((text) => { setTextContent(text) });
  }
  function onLogout() {

    fetchLogout();
    return null;
  }

  return (
    <div>


      <div className='mainbody'>
        <ul className="nav-links" >
         
          
          <li className="nav_item" ><a href="./api/tiger" onClick={(e) => { e.preventDefault(); tigershowclick() }}>Tiger</a></li>
          
          <li className="nav_item" ><a href="./api/panda" onClick={(e) => { e.preventDefault(); pandashowclick() }}>Panda</a></li>
          
          <li className="nav_item" ><a href="'./api/koala'" onClick={(e) => { e.preventDefault(); kaolashowclick() }}>Koala</a></li>
         
          <li className="nav_item" ><a href="./api/kangaroo" onClick={(e) => { e.preventDefault(); kangarooshowclick() }}>Kangaroo</a></li>
          <li className="nav_item" ><a  href="'./api/commentdata'" onClick={(e) => { e.preventDefault();commentshowclick()}}>Comments</a></li>

          <li className="nav_item logout"><a href="/api/session" onClick={onLogout}>Logout</a></li>
        </ul>
      </div> 

     
      <div className="mainSection">

      {tigerComing && <TigerBody Textcontent={Textcontent} />}
        {pandaComing && <PandaBody Textcontent={Textcontent} />}
        {koalaComing && <KoalaBody Textcontent={Textcontent} />}
        {kangarooComing && <KangarooBody Textcontent={Textcontent} />}
        {comment && <CommentPage  />}
       
      </div>
    </div>
  );
};

export default Navigation;




