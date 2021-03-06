import React from 'react';
import { HashRouter } from 'react-router-dom';
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import { PersistGate } from 'redux-persist/integration/react'
import './index.css';
import App from './App';
// import configureStore from './store/configureStore.js';
import { store, persistor } from './store/configureStore.js';



const target = document.querySelector('#root')
render(
    <Provider store={store}>
        <PersistGate loading={null} persistor={persistor}>
            <HashRouter basename={'/paw-2018b-06'}>
                <App />
            </HashRouter>
        </PersistGate>
    </Provider>
    ,target)