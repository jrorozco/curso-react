import React from 'react';
import TwitterLogo from '../../assets/img/original.png';

import "./Header.scss";

export default function Header() {
    return (
        <div className="header">
            <img src={TwitterLogo} alt="Twees Simulator"/>
            <h1>Tweets Simulator</h1>
        </div>
    )
}
