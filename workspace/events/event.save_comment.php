<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventsave_comment extends Event{

		const ROOTELEMENT = 'save-comment';

		public $eParamFILTERS = array(
			'send-email',
				'akismet',
				'cachelite-entry',
				'cachelite-section',
				'cachelite-url'
		);

		public static function about(){
			return array(
				'name' => 'Save comment',
				'author' => array(
					'name' => 'Tim Stone',
					'website' => 'http://fetimo.com/blog',
					'email' => 'tim@fetimo.com'),
				'version' => 'Symphony 2.2.3',
				'release-date' => '2011-09-22T09:10:32+00:00',
				'trigger-condition' => 'action[save-comment]'
			);
		}

		public static function getSource(){
			return '2';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-comment result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/save-comment></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-comment result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/save-comment></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;save-comment result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/save-comment></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;label>Comment
    &lt;textarea name="fields[comment]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Date
    &lt;input name="fields[date]" type="text" />
  &lt;/label>
  &lt;input name="fields[commented-on]" type="hidden" value="..." />
  &lt;input name="action[save-comment]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://fetimo.com/blog/success/" /></code></pre>
        <h3>Send Notification Email</h3>
        <p>Upon the event successfully saving the entry, this option takes input from the form and send an email to the desired recipient. <b>It currently does not work with "Allow Multiple".</b> The following are the recognised fields:</p>
        <pre class="XML"><code>send-email[sender-email] // Optional
send-email[sender-name] // Optional
send-email[reply-to-email] // Optional
send-email[reply-to-name] // Optional
send-email[subject]
send-email[body]
send-email[recipient] // list of comma-separated author usernames.</code></pre>
        <p>All of these fields can be set dynamically using the exact field name of another field in the form as shown below in the example form:</p>
        <pre class="XML"><code>&lt;form action="" method="post">
  &lt;fieldset>
    &lt;label>Name &lt;input type="text" name="fields[author]" value="" />&lt;/label>
    &lt;label>Email &lt;input type="text" name="fields[email]" value="" />&lt;/label>
    &lt;label>Message &lt;textarea name="fields[message]" rows="5" cols="21">&lt;/textarea>&lt;/label>
    &lt;input name="send-email[sender-email]" value="fields[email]" type="hidden" />
    &lt;input name="send-email[sender-name]" value="fields[author]" type="hidden" />
    &lt;input name="send-email[reply-to-email]" value="fields[email]" type="hidden" />
    &lt;input name="send-email[reply-to-name]" value="fields[author]" type="hidden" />
    &lt;input name="send-email[subject]" value="You are being contacted" type="hidden" />
    &lt;input name="send-email[body]" value="fields[message]" type="hidden" />
    &lt;input name="send-email[recipient]" value="fred" type="hidden" />
    &lt;input id="submit" type="submit" name="action[save-contact-form]" value="Send" />
  &lt;/fieldset>
&lt;/form></code></pre>
        <h3>Akismet Spam Filtering</h3>
        <p>Each entry will be passed to the <a href="http://akismet.com/">Akismet Spam filtering service</a> before saving. Should it be deemed as spam, Symphony will terminate execution of the Event, thus preventing the entry from being saved. You will receive notification in the Event XML. <strong>Note: Be sure to set your Akismet API key in the <a href="http://fetimo.com/blog/symphony/system/preferences/">Symphony Preferences</a>.</strong></p>
        <p>The following is an example of the XML returned form this filter:</p>
        <pre class="XML"><code>&lt;filter type="akismet" status="passed" />
&lt;filter type="akismet" status="failed">Author, Email and URL field mappings are required.&lt;/filter>
&lt;filter type="akismet" status="failed">Data was identified as spam.&lt;/filter></code></pre>
        <p>In order to provide Akismet with a correct set of data, it is required that you provide field mappings of Author, Email and URL. The value of these mappings directly point to values in the <code>fields</code> array of <code>POST</code> data. To specify a literal value, enclose the hidden fields <code>value</code> attribute in single quotes. In the following example, <code>author</code>, <code>website</code> and <code>email</code> would correspond to <code>fields[author]</code>, <code>fields[website]</code> and <code>literal@email.com</code> respectively:</p>
        <pre class="XML"><code>&lt;input name="akismet[author]" value="author" type="hidden" />
&lt;input name="akismet[email]" value="\'literal@email.com\'" type="hidden" />
&lt;input name="akismet[url]" value="website" type="hidden" /></code></pre>
        <h3>CacheLite: Expiring the cache</h3>
        <h4>Expire cache for pages showing this entry</h4>
        <p>When editing existing entries (one or many, supports the <em>Allow Multiple</em> option) any pages showing this entry will be flushed. Add the following in your form to trigger this filter:</p>
        <pre class="XML"><code>&lt;input type="hidden" name="cachelite[flush-entry]" value="yes"/></code></pre>
        <h4>Expire cache for pages showing content from this section</h4>
        <p>This will flush the cache of pages using any entries from this event&#8217;s section. Since you may want to only run it when creating new entries, this will only run if you pass a specific field in your HTML:</p>
        <pre class="XML"><code>&lt;input type="hidden" name="cachelite[flush-section]" value="yes"/></code></pre>
        <h4>Expire cache for the passed URL</h4>
        <p>This will expire the cache of the URL at the value you pass it. For example</p>
        <pre class="XML"><code>&lt;input type="hidden" name="cachelite[flush-url]" value="/article/123/"/></code></pre>
        <p>Will flush the cache for <code>http://domain.tld/article/123/</code>. If no value is passed it will flush the cache of the current page (i.e., the value of <code>action=""</code> in you form):</p>
        <pre class="XML"><code>&lt;input type="hidden" name="cachelite[flush-url]"/></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['save-comment'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
