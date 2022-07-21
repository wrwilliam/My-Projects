// import React from "react";
import '../Css/Notice.css'
import { NavLink } from "react-router-dom";




const Notice=()=>{
return(

  <>
     
   <h1>Notice to visitors</h1>
    <div className="notices">
        <ul className="skip-links">
            
            
           <li className="notice">Lorem ipsum dolLorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum minus iste nam minima quia qui labore consectetur impedit fuga! Beatae!or, sit amet consectetur adipisicing elit. Rerum minus iste nam minima quia qui labore consectetur impedit fuga! Beatae!</li>

           <li className="notice" id="nav">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum minus iste nam minima quia qui labore consectetur impedit fuga! Beatae!Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum minus iste nam minima quia qui labore consectetur impedit fuga! Beatae!</li>

          <li className="notice">Lorem Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rerum minus iste nam minima quia qui labore consectetur impedit fuga! Beatae!ipsum dolor, sit amet consectetur adipisicing elit. Rerum minus iste nam minima quia qui labore consectetur impedit fuga! Beatae!</li>
            
 </ul> 
 {/* <div className='loadingimage'> <Loading/></div> */}
  <div className="btnBox">
                        <div className="btn">
                           <NavLink to="/" className="homepagebtn">To Homepage</NavLink>
                            {/* <Route exact path="/" element = { <Home /> }/>            */}
                            {/* <NavLink to="/" className="headbtn" activeClassName="activeItem">Home</NavLink> */}
                      </div>
 
                        </div>

   </div>
    </>
 )
 }

export default Notice;