export const fetchLoginGet = function () {
  return fetch('/api/session', {
    method: 'GET'
  })
    .catch(() => {
      return Promise.reject({ error: 'network-error' });
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return response.json().then(err => Promise.reject(err));
    });
}

export const fetchCommentGet = function () {
  return fetch('/api/commentdata', {
    method: 'GET'
  })
    .catch(() => {
      return Promise.reject({ error: 'network-error' });
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return response.json().then(err => Promise.reject(err));
    });
}


export const fetchCommentPost = function (description) {
  return fetch('/api/commentdata', {
    method: 'POST',
    headers: new Headers({
      'content-type': 'application/json',
    }),
    body: JSON.stringify({ description }),
  })
    .catch(() => {
      return Promise.reject({ error: 'network-error' });
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return response.json().then(err => Promise.reject(err));
    });
}


export const fetchLoginPost = function ({ username }) {
  return fetch('/api/session', {
    method: 'POST',
    headers: new Headers({
      'content-type': 'application/json',
    }),
    body: JSON.stringify({ username }),
  })
    .catch(() => {
      return Promise.reject({ error: 'network-error' });
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return response.json().then(err => Promise.reject(err));
    });
}

export const fetchLogout = function () {
  return fetch('/api/session', {
    method: 'DELETE',
  })
    .catch(() => Promise.reject({ error: 'network-error' }))
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return response.json().then(json => Promise.reject(json));
    });
};




export const fetchgettiger = () => {
  return fetch('/api/tiger')
    .then(response => {
      if (response.ok) {
        console.log(response.json)
        return response.json();
      }
      return Promise.reject({ error: 'networkError' });
    });
};



export const fetchgetpanda = () => {
  return fetch('/api/panda', {
    method: 'GET',
  })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return Promise.reject({ error: 'networkError' });
    });
};




export const fetchgetkoala = () => {
  return fetch('/api/koala', {
    method: 'GET',
  })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return Promise.reject({ error: 'networkError' });
    });
};



export const fetchgetkangaroo = () => {
  return fetch('/api/kangaroo', {
    method: 'GET',
  })
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      return Promise.reject({ error: 'networkError' });
    });
};

