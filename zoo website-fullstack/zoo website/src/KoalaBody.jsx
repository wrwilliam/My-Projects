import image from './Images/5.png'
import './TigerBody.css';



function KoalaBody({ Textcontent }) {
            

        return (
            <div className="mainSection">
            <div className="contentBox">
                <h1>Koala, lazy or cute?</h1>
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
    
    
                export default KoalaBody;