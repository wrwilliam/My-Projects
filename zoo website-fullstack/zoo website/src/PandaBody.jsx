import image from './Images/3.png'
import './TigerBody.css';



function PandaBody({ Textcontent }) {


        return (
            <div className="mainSection">
            <div className="contentBox">
                <h1>Pandas, cute !!!</h1>
                <p>
                {Textcontent['data']}

    
                </p>
            
            </div>
            <div className="imgContainer">
                <img src={image} alt="tiger picture"/>
            </div>
        </div>
                )
        
        }
    
    
                export default PandaBody;