import React from "react";
import { NavLink } from "react-router-dom";
import homeimg from '../Images/1.jpg'
import '../Css/Home.css'
import Shownotshow from "./Shownotshow";

const Home = () => {
    return (

        <>
            <div className="mainSection">
                <div className="contentBox">
                    <h1>Famous yellow place</h1>
                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Commodi magnam aliquam aliquid? Nemo, mollitia excepturi! Reprehenderit, dolores fugit. Fuga fugit provident incidunt ipsum fugiat suscipit sunt placeat repellat vero voluptas....

                    </p>
                    <Shownotshow />
                    {/* <div className="rotation"> Loading...</div> */}
                    <div className="btnBox">
                        <div className="btn">
                            <NavLink to="/slider" className="readMore">Enjoy Pictures now?</NavLink>

                        </div>
                    </div>
                </div>
                <div className="imgContainer">
                    <img src={homeimg} alt="Yellow mountain" />
                </div>
            </div>
        </>
    )

}
export default Home;