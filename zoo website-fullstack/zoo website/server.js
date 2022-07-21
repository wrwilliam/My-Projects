

const express = require('express');
const cookieParser = require('cookie-parser');
const uuid = require('uuid').v4;
const app = express();
const PORT = 4000;

const zoodata = require('./zoodata');
const commentdata = require('./commentdata');

app.use(express.static('./build'));
app.use(cookieParser());
app.use(express.json());


const sessions = {};
function addSession(username) {
    const sid = uuid();
    sessions[sid] = {
        username,
    };
    return sid;
};

function getSessionUser(sid) {
    return sessions[sid]?.username;
}

function deleteSession(sid) {
    delete sessions[sid];
}

app.get('/api/session', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'nothing input' });
        return;
    }
    res.json({ username });
});

app.post('/api/session', (req, res) => {
    const { username } = req.body;

    if (!username||!username.trim()) {
        res.status(400).json({ error: 'no_inputting' });
        return;
    }
    if (username === 'dog') {
        res.status(403).json({ error: 'dog_is_not_a_useranme' });
        return;
    }
    const sid = addSession(username);

    res.cookie('sid', sid);
    res.json(commentdata.comment_history);
});

app.delete('/api/session', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (sid) {
        res.clearCookie('sid');
    }
    if (username) {

        deleteSession(sid);
    }
    res.json({ username });
});

// comments session
app.get('/api/commentdata', (req, res) => {

    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'no-yet-login' });
        return;
    }
    res.json(commentdata.comment_history);
});

app.post('/api/commentdata', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'no-yet-login' });
        return;
    }
    const sender = username;
    const { description } = req.body;
    if (!description) {
        res.status(400).json({ error: 'no_text' });
        return;
    }

    commentdata.addMesssage({ sender, description })
    // console.log(commentdata.comment_history)
    res.json(commentdata.comment_history);
});


app.get('/api/tiger', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'not-login' });
        return;
    }
    // const numberRecord = sessions.getUserData(username);
    res.json({ data: zoodata['tiger'] });
});

app.get('/api/panda', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'not-login' });
        return;
    }
    // const numberRecord = sessions.getUserData(username);
    res.json({ data: zoodata['panda'] });
});

app.get('/api/koala', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'not-login' });
        return;
    }
    // const numberRecord = sessions.getUserData(username);
    res.json({ data: zoodata['koala'] });
});
app.get('/api/kangaroo', (req, res) => {
    const sid = req.cookies.sid;
    const username = sid ? getSessionUser(sid) : '';
    if (!sid || !username) {
        res.status(401).json({ error: 'not-login' });
        return;
    }
    // const numberRecord = sessions.getUserData(username);
    res.json({ data: zoodata['kangaroo'] });
});





app.listen(PORT, () => console.log(`http://localhost:${PORT}`));
