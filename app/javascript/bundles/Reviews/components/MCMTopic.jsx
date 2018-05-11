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

  addNewSentenceForm = () => {
    let sentences = document.getElementById("sentences");
    const st = <label for="mcm_topic_score">Score</label>
    sentence_score: <input type="text" name="mcm_topic[sentence_scores_attributes][1][score]" id="mcm_topic_sentence_scores_attributes_1_score"></input>
    sentence_score: <input type="text" name="mcm_topic[sentence_scores_attributes][1][sentence]" id="mcm_topic_sentence_scores_attributes_1_sentence"></input>
    sentences.insertAdjacentHTML('beforeend', st)
    
  }


  render() {
    const sentencess = <label for="mcm_topic_score">Score</label>
              sentence_score: <input type="text" name="mcm_topic[sentence_scores_attributes][0][score]" id="mcm_topic_sentence_scores_attributes_0_score"></input>
              sentence_score: <input type="text" name="mcm_topic[sentence_scores_attributes][0][sentence]" id="mcm_topic_sentence_scores_attributes_0_sentence"></input>
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
      <div><button onClick={this.addNewSentenceForm}/></div>
      <form action="/mcm_topics" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓" /><input type="hidden" name="authenticity_token" value="G+JBLvLlJPDPPFAlNPG9jI3aDBAaCY6ksjKdFvf/DdFRliXJzKtd0nEfjJNSGW9lPPa/bjWGqKF8JuJ84bjZMQ=="/>

        <div class="field">
          <label for="mcm_topic_topic_name">Topic name</label>
          <input id="mcm_topic_topic_name" type="text" name="mcm_topic[topic_name]"></input>
        </div>

        <div class="field">
          <label for="mcm_topic_user_id">User</label>
          <input id="mcm_topic_user_id" type="number" name="mcm_topic[user_id]"></input>
        </div>

        
          <p id="sentences">
            
              {sentencess}
          </p>

        <div class="actions">
          <input type="submit" name="commit" value="Create Mcm topic" data-disable-with="Create Mcm topic"></input>
        </div>
      </form>
      </div>
    );
  }
}
