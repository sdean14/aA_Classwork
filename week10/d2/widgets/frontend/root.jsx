import React from 'react';
import Clock from './clock';
import Tab from './tabs';

const Root = () => {

    const tabsArr = [
        {title: 1, content: 'Watson is fluffy and makes me happy'},
        {title: 2, content: 'Mike is lovely and makes me happy'},
        {title: 3, content: 'Both of them make me vary happy'}        
    ];

    return (
        <div>
            <Clock/>
            <Tab tabs={tabsArr}/>
        </div>
    )
}

export default Root;