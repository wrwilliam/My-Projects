
// import { NavLink } from "react-router-dom";
import React, { useEffect, useState } from "react";
import SliderContent from "./SliderContent.jsx";
import Dots from "./Dots";
import Arrows from "./Arrows";
import sliderImage from "./sliderImage";
import "../Css/Slider.css";

const len = sliderImage.length - 1;

function Slider(props) {
  const [activeIndex, setActiveIndex] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setActiveIndex(activeIndex === len ? 0 : activeIndex + 1);
    }, 2000);
    return () => clearInterval(interval);
  }, [activeIndex]);

  return (
    <div className="slider-container">
      <SliderContent activeIndex={activeIndex} sliderImage={sliderImage} />
      <Arrows
        prevSlide={() =>
          setActiveIndex(activeIndex < 1 ? len : activeIndex - 1)
        }
        nextSlide={() =>
          setActiveIndex(activeIndex === len ? 0 : activeIndex + 1)
        }
      />
      <Dots
        activeIndex={activeIndex}
        sliderImage={sliderImage}
        onclick={(activeIndex) => setActiveIndex(activeIndex)}
      />
{/* 
<div className="btnBox">
                        <div className="btn">
                           <NavLink to="/" className="homepagebtn">To Homepage</NavLink>
                            {/* <Route exact path="/" element = { <Home /> }/>            */}
                            {/* <NavLink to="/" className="headbtn" activeClassName="activeItem">Home</NavLink> */}
                      {/* </div> */}
 
                        {/* </div> */} 

    </div>
  );
}

export default Slider;