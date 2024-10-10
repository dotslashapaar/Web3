import ReactDOM from 'react-dom'
import React from 'react'
import App from "./components/App";
import {AuthClient} from '@dfinity/auth-client';
 
const init = async () => {
  const authClient = await AuthClient.create();
 
  if (await authClient.isAuthenticated()) {
    handleAuthenticated(authClient);
  } else {
    await authClient.login({
      identityProvider: 'https://identity.ic0.app/#authorize',
      onSuccess: () => {
        handleAuthenticated(authClient);
      },
    });
  }
};
 
const handleAuthenticated = (authClient) => {
  ReactDOM.render(<App />, document.getElementById('root'));
};
 
init();


// If you are running locally uncomment below lines and comment evverthing else
// import ReactDOM from 'react-dom'
// import React from 'react'
// import App from "./components/App";

// const init = async () => { 
//   ReactDOM.render(<App />, document.getElementById("root"));
// }

// init();