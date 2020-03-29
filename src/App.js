import React, {useState, useEffect} from 'react';
import Header from "./components/Header";
import SendTweet from "./components/SendTweet";
import {Container, Snackbar} from "@material-ui/core";
import {TWEET_STORAGE} from './utils/constants';


function App() {
  const [toastProps, setToastProps] = useState({
    open:false,
    text:null
  });
  const [allTweets, setAllTweets] =useState([]);
  useEffect( ()=> {
    const AllTweetsStorage = localStorage.getItem(TWEET_STORAGE);
    const AllTweetsArray = JSON.stringify(AllTweetsStorage);
    setAllTweets(AllTweetsArray);
  }, []);
  console.log(setAllTweets);
  return (
   <Container className="tweets-simulator" maxWidth={false}>
    <Header />
    <SendTweet setToastProps={setToastProps} allTweets={allTweets}/>
    
    <Snackbar 
      anchorOrigin={{
        vertical:"top",
        horizontal:"right"
      }}
      open={toastProps.open}
      autoHideDuration={1000}
      message={<span id="message-id" >{toastProps.text}</span>}
    />
   </Container>
  );
}

export default App;
