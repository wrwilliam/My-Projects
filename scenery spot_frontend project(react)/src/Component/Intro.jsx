import React from "react";
import '../Css/Intro.css'
import { NavLink } from "react-router-dom";

const Intro=()=>{
return(

    <>
    <div className="mainSection">
        <div className="contentBoxs">
            <h1>The nice place introduce</h1>
            <div className="detail">
                <div className="summary">
                    <h2 className="more-detail">Beautiful scenery</h2>
                    <p className="toanswer">Lorem ipsum dolor, sit amet consectetur adipisicing elit. A totam inventore molestiae temporibus nihil dolorum pariatur alias, eveniet reprehenderit minima laboriosam, expedita eum voluptatem voluptatibus quaerat labore eius, nisi suscipit error! Excepturi sapiente enim, nobis, ut exercitationem laudantium architecto sit veniam, harum dolorum cupiditate dolor quae similique quibusdam eveniet cum?</p>
                    <p className="toanswer">Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque voluptatibus eligendi iste. Quia suscipit quis magnam tempora exercitationem maiores laborum consectetur debitis, a omnis dolores! Ad natus dignissimos libero eius nostrum sit rerum, modi delectus eaque accusamus dolorem voluptatum minus tenetur veritatis consectetur maxime obcaecati officia. Veniam facere itaque amet.</p>
                </div>
                <div className="introduce">
                    <h2 className="introduceJoin">History and Culture</h2>
                    <p className="toanswer">Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque voluptatibus eligendi iste. Quia suscipit quis magnam tempora exercitationem maiores laborum consectetur debitis, a omnis dolores! Ad natus dignissimos libero eius nostrum sit rerum, modi delectus eaque accusamus dolorem voluptatum minus tenetur veritatis consectetur maxime obcaecati officia. Veniam facere itaque amet.</p>
                    <p className="toanswer">Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque voluptatibus eligendi iste. Quia suscipit quis magnam tempora exercitationem maiores laborum consectetur debitis, a omnis dolores! Ad natus dignissimos libero eius nostrum sit rerum, modi delectus eaque accusamus dolorem voluptatum minus tenetur veritatis consectetur maxime obcaecati officia. Veniam facere itaque amet.</p>
                </div>
            </div>
            <div className="rotation"> Loading...</div>
            <div >
            <div className="btnBox">
                        <div className="btn">
                            <NavLink to="/" className="homepagebtn">To Homepage</NavLink>
                            {/* <Route exact path="/" element = { <Home /> }/>            */}
                            {/* <NavLink to="/" className="headbtn" activeClassName="activeItem">Home</NavLink> */}
                        </div>
 
                        </div>
            </div>
            
            </div>
        </div>
        
    
    </>
)

}
export default Intro;