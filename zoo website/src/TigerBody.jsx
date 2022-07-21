import image from './Images/1.png'
import './TigerBody.css';



function TigerBody({ Textcontent }) {

    return (
        <div className="mainSection">
            <div className="contentBox">
                <div className='title'> 
                <h1>Tiger Home</h1>
                </div>

                <div className='maintext'>
                   <p>{Textcontent['data']} </p>
                    

                </div>

            </div>
            <div className="imgContainer">
                <img src={image} alt="tiger picture" />
            </div>
        </div>
    )

}


export default TigerBody;