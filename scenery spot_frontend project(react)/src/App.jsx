import React from 'react';
import {Routes, Route} from 'react-router-dom';
import Home from './Component/Home';
import Intro from './Component/Intro';
import Form from './Component/Form';
import Slider from './Component/Slider';
import Notice from './Component/Notice.jsx';
import Error from './Component/Error';
import Nav from './Component/Nav';
import Footer from './Component/Footer';





const App=() =>{
  return(
    <>
    <Nav/>
<Routes>
  <Route path="*" element = { <Error /> }/>
  <Route exact path="/" element = { <Home /> }/>
  <Route path="/intro" element = { < Intro/> }/>
  <Route path="/form" element = { <Form /> }/>
  <Route path="/slider" element = { <Slider /> }/>
  <Route path="/notice" element = { <Notice /> }/>
  
</Routes>
<Footer />
    </>

  )
}

export default App;