<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcearchive_months extends Datasource{

		public $dsParamROOTELEMENT = 'archive-months';
		public $dsParamORDER = 'desc';
		public $dsParamGROUP = '4';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '50';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'categories',
				'date'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Archive Months',
				'author' => array(
					'name' => 'Tim Stone',
					'website' => 'http://fetimo.com/blog',
					'email' => 'tim@fetimo.com'),
				'version' => 'Symphony 2.2.2',
				'release-date' => '2011-08-06T23:18:35+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
