import React, {useState} from 'react';
import { Fab } from '@material-ui/core';
import AddIcon from '@material-ui/icons/Add';
import "./SendTweet.scss";
import moment from 'moment';
import ModalContainer from '../ModalContainer';
import FormSendTweet from '../FormSendTweet';
import { TWEET_STORAGE } from '../../utils/constants';

export default function SendTweet(props) {

    const {setToastProps, allTweets} = props;
    const [isOpenModal, setIsOpenModal] = useState(false);

    const sendTweet = (event,formValue) => {
        event.preventDefault();
       const { name, tweet} = formValue; // guadamos el objeto destructurado que nos llega por argumento...
        let allTweetsArray=[];// declaramos un array para obtener los datos del formulario
        if(!name || !tweet) {
            console.log('WARNING : Todos los campos on obligatorios');
            setToastProps({
                open:true,
                text:"WARNING : Todos los campos on obligatorios"
            });
        } else {
            formValue.time = moment();
            allTweetsArray.push(formValue);// llenamos el array con los datos del formulario...
            localStorage.setItem(TWEET_STORAGE, JSON.stringify(allTweetsArray));// lo guardamos en le local storage
            console.log("Tweet enviado correctamente");
            setToastProps({
                open:true,
                text:"Correcto : Tweet enviado correctamente"
            });
            closeModal();
        }
        allTweetsArray =[];
        if(allTweets) {
            allTweetsArray =allTweets;
        }
    }  
    /**Creamos una funcion para cambiar la bandera  de isOpenModal */
    const openModal= () => {
        setIsOpenModal(true);
    }

    const closeModal= () => {
        setIsOpenModal(false);
    }

    return (
        <div className="send-tweet">
            <Fab
                className="send-tweet__open-form"
                color="primary"
                arial-label="add"
                onClick={openModal}
            >
                <AddIcon />
            </Fab>
                <ModalContainer isOpenModal={isOpenModal} closeModal={closeModal} >
                    <FormSendTweet sendTweet={sendTweet}/>
                </ModalContainer>
        </div>
    )
}
