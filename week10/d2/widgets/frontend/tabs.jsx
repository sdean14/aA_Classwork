import React from 'react';

class Headers extends React.Component {
    render() {
        const selected = this.props.selectedTabIdx;
        const headers = this.props.tabs.map((tab, idx) => {
            const title = tab.title;
            const klass = idx === selected ? 'active' : '';
    
            return (
                <li
                    key={idx}
                    className={klass}
                    onClick={() => this.props.onTabChosen(idx)}>
                    {title}{' '}
                </li>
            );
        });
        return (
            <ul className='tab-header'>
                {headers}
            </ul>
        );
   }
}

export default class Tab extends React.Component {
    constructor(props) {
        super(props)

        this.state = {
            selectedTabIdx: 0
        }
        this.selectTab = this.selectTab.bind(this);
    }
    selectTab(num) {
        this.setState({selectedTabIdx: num});
    }
    render() {
        const tab = this.props.tabs[this.state.selectedTabIdx];

        return (
          <div>
            <h1 className='boxtitle'>Tabs</h1>
            <div className='tabs'>
              <Headers
                selectedTabIdx={this.state.selectedTabIdx}
                onTabChosen={this.selectTab}
                tabs={this.props.tabs}>
              </Headers>
              <div className='tab-content'>
                <article>
                  {tab.content}
                </article>
              </div>
            </div>
          </div>
        );
    }
        // const tabbers = this.props.tabs.map((tab, idx) => {
        //     return (
        //         <div>
        //             <li key={idx}>{tab.title}</li>
        //             <article>{tab.content}</article>
        //         </div>
        //     );
        // });
        // return (
        //     <ul>{tabbers}</ul>
        // )
        // }
}






