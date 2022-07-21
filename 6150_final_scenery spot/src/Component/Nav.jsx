import React from "react";
import { NavLink } from "react-router-dom";

import '../Css/Nav.css'

const Nav=()=>{
return(

    <>
   <header>
       <div className="container container_flex">
          
           <nav>
               <div className="list">
                   <NavLink to="/" className="headbtn" activeClassName="activeItem">Home</NavLink>
                     <NavLink to="/Form" className="headbtn" activeClassName="activeItem">Register</NavLink>
                     <NavLink to="/Intro" className="headbtn" activeClassName="activeItem">Introduction</NavLink>
                 
                   <NavLink to="/Slider" className="headbtn" activeClassName="activeItem">Images</NavLink>
                   <NavLink to="/Notice" className="headbtn" activeClassName="activeItem">Notices</NavLink>
               </div>
           </nav>
       </div>
   </header>
    </>
)

}
export default Nav;