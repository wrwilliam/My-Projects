import './CommentShow.css';

const CommentShow = ({ messageList }) => {


    return (
        <div className="chat-page">
            <h2>Comments history</h2>


<ul className="comment">
                {(messageList).map((comment) => {
                    console.log(comment['description'])
                    return (<li key={comment['id']} >
                        <li className="time">sender:{comment["sender"]}, sending time:{comment['timeStamp']}</li>
                        <li className='descript'>{comment['description']}</li>
                    </li>)


                }
                )}

            </ul >
        </div>
    )
}

export default CommentShow;