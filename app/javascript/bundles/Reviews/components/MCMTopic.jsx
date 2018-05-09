import PropTypes from 'prop-types';
import React from 'react';

export default class MCMTopic extends React.Component {
  static propTypes = {
    mcmObject: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class
    this.state = { };
  }

  updateSentence = () => {
    console.log("Updating..")
  }


  render() {
    const scores = this.props.mcmObject.sentences.map((sentence) => {
      return (<form >
          <label htmlFor="sentence">
            {sentence.score}:
          </label>
          <input
            id="sentence"
            type="text"
            value={sentence.sentenceText}
            onChange={this.updateSentence}
          />
        </form>)
    })
    return (
      <div>
        <h3>
          MCM 
        </h3>
        <hr />
        {scores}
      </div>
    );
  }
}
