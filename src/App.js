import React, {useState, useEffect} from 'react';
import Header from "./components/Header";
import SendTweet from "./components/SendTweet";
import {Container, Snackbar} from "@material-ui/core";
import {TWEET_STORAGE} from './utils/constants';
import ListTweets from './components/ListTweets';


function App() {
  const [toastProps, setToastProps] = useState({
    open:false,
    text:null
  });
  // creamos un estado...
  const [allTweets, setAllTweets] =useState([]);

  useEffect( ()=> {
    const AllTweetsStorage = localStorage.getItem(TWEET_STORAGE);
    const AllTweetsArray = JSON.parse(AllTweetsStorage);
    setAllTweets(AllTweetsArray);
  }, []);

const deleteTweet = (index) => {
  allTweets.splice(index,1);
  setAllTweets(allTweets);
  localStorage.setItem(TWEET_STORAGE,JSON.stringify(allTweets));

}

  console.log(setAllTweets);
  return (
   <Container className="tweets-simulator" maxWidth={false}>
    <Header />
    <SendTweet setToastProps={setToastProps} allTweets={allTweets}/>
    <ListTweets  allTweets={allTweets} deleteTweet={deleteTweet} />
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
