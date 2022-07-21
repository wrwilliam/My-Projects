import image from './Images/8.png'
import './TigerBody.css';


function Kangaroobody({Textcontent}) {


        return (
            <div className="mainSection">
            <div className="contentBox">
                <h1>Kangaroo, Fantastic Animals</h1>
                <p>
                {Textcontent['data']}
    
                </p>
            
            </div>
            <div className="imgContainer">
                <img src={image} alt="picture"/>
            </div>
        </div>
                )
        
        }
    
    
                export default Kangaroobody;