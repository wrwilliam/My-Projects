const comment_history = 
    [
        {
    "id": 1,
   "sender":"Wang",
    "timeStamp": "2021.5.3 12:25:16",
    "description":"He is so lazy, is it?"
  },
  
  {
    "id": 2,
    "sender":"Liu",
    "timeStamp": "2020.12.12 15:29:16",
    "description": "I admire breeders in the zoo, who can play with pandas everyday!"
  },
  {
    "id": 3,
    "sender":"Jack",
    "timeStamp": "2019.12.18 15:29:38",
    "description": "I love these animals, they are so cute, so smart, like babies!"  
  }
]
   
       

function addMesssage({sender,description}){
    const currentDate = new Date();

const currentDayOfMonth = currentDate.getDate();
const currentMonth = currentDate.getMonth(); // Be careful! January is 0, not 1
const currentYear = currentDate.getFullYear();
const currentHour=currentDate.getHours();
const currentMinutes=currentDate.getMinutes();
const currentSecond=currentDate.getSeconds();


const dateString =   currentYear+"."+ (currentMonth + 1) +"."  +  currentDayOfMonth +"   "+currentHour+":"+  currentMinutes+":"+ currentSecond;

    comment_history.unshift({ "id":comment_history.length+1, "sender":sender,"timeStamp": dateString, "description":description });
}

const commentdata = {
    comment_history,
    addMesssage
}
module.exports = commentdata;