import React from 'react';
import {Modal} from '@material-ui/core';
import './ModalContainer.scss';
export default function (props) {

    //en el modal vamos a recibir por props si esta abierto la ordes closeModal para cerrarlo y children
    const  {isOpenModal, closeModal, children } = props;
    return (
        <Modal
        aria-labelledby="transition-modal-title"
      aria-describedby="transition-modal-description"
         className="modal"
         open={isOpenModal}
         onClose={closeModal}
         closeAfterTransition
         >
            <div>{children}</div>
        </Modal>
    )
}
