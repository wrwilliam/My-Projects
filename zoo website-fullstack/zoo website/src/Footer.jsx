import React from "react";
import './Footer.css';

const Footer=()=>{
let date = new Date();

    
    return(

    <>
    <footer>
        <div className="footer1">
        &copy;{
           date.toLocaleString(undefined, {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    })
        }| Super Zoo |
  All rights reserved |
            Terms Of Service | Privacy | Contact us
        </div>
    </footer>
    </>
)

}
export default Footer;