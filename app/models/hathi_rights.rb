# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class HathiRights
  attr_reader :note, :user, :time, :namespace, :source, :attribute, :id, :reason, :raw
  
  REASON = {
  '1' => {:id => '1', :name => 'bib', :description => 'bibliographically-derived by automatic processes'},
  '2' => {:id => '2', :name => 'ncn', :description => 'no printed copyright notice'},
  '3' => {:id => '3', :name => 'con', :description => 'contractual agreement with copyright holder on file'},
  '4' => {:id => '4', :name => 'ddd', :description => 'due diligence documentation on file'},
  '5' => {:id => '5', :name => 'man', :description => 'manual access control override; see note for details'},
  '6' => {:id => '6', :name => 'pvt', :description => 'private personal information visible'},
  '7' => {:id => '7', :name => 'ren', :description => 'copyright renewal research was conducted'},
  '8' => {:id => '8', :name => 'nfi', :description => 'needs further investigation (copyright research partially complete; an ambiguous, unclear, or other time-consuming situation was encountered)'},
  '9' => {:id => '9', :name => 'cdpp', :description => 'title page or verso contain copyright date and/or place of publication information not in bib record'},
  '10' => {:id => '10', :name => 'cip', :description => 'condition review and in-print status research was conducted'},
  '11' => {:id => '11', :name => 'unp', :description => 'unpublished work'},
  '12' => {:id => '12', :name => 'gfv', :description => 'Google viewability set at VIEW_FULL'},
  '13' => {:id => '13', :name => 'crms', :description => 'derived from multiple reviews in the Copyright Review Management System (CRMS) via an internal resolution policy; consult CRMS records for details'},
  '14' => {:id => '14', :name => 'add', :description => 'author death date research was conducted or notification was received from authoritative source '},
  '15' => {:id => '15', :name => 'exp', :description => 'expiration of copyright term for non-US work with corporate author'},
  '16' => {:id => '16', :name => 'del', :description => 'deleted from the repository; see note for details'},
  '17' => {:id => '17', :name => 'gatt', :description => 'non-US public domain work restored to in-copyright in the US by GATT'},
  '18' => {:id =>  '18', :name => 'supp', :description => 'suppressed from view; see note for details'}
  }
  
  SOURCE = {
  '1' => {:id => '1', :name => 'google', :description => 'Google'},
  '2' => {:id => '2', :name => 'lit-dlps-dc', :description => 'Library IT, Digital Library Production Service, Digital Conversion'},
  '3' => {:id => '3', :name => 'ump', :description => 'University of Michigan Press'},
  '4' => {:id => '4', :name => 'ia', :description => 'Internet Archive'},
  '5' => {:id => '5', :name => 'yale', :description => 'Yale University'},
  '6' => {:id => '6', :name => 'umn', :description => 'University of Minnesota'},
  '7' => {:id => '7', :name => 'mhs', :description => 'Minnesota Historical Society'},
  '8' => {:id => '8', :name => 'usup', :description => 'Utah State University Press'},
  '9' => {:id => '8', :name => 'ucm', :description => 'Universidad Complutense de Madrid'},
  '10' => {:id => '10', :name => 'purd', :description => 'Purdue University'},
  '11' => {:id => '11', :name => 'getty', :description => 'Getty Research Institute'},
  '12' => {:id => '12', :name => 'um-dc-mp', :description => 'University of Michigan, Duderstadt Center, Millennium Project'},
  '13' => {:id => '13', :name => 'uiuc', :description => 'University of Illinois at Urbana-Champaign'},
  '14' => {:id => '14', :name => 'brooklynmuseum', :description => 'Brooklyn Museum'},
  '15' => {:id => '15', :name => 'uf', :description => 'University of Florida'},
  '16' => {:id => '16', :name => 'tamu', :description => 'Texas A&M'}
  }
  
  ATTRIBUTES = {
    '1' => {:id => '1', :name => 'pd', :type => 'copyright', :description => 'public domain'},
    '2' => {:id => '2', :name => 'ic', :type => 'copyright', :description => 'in-copyright'},
    '3' => {:id => '3', :name => 'opb', :type => 'copyright', :description => 'out-of-print and brittle (implies in-copyright)'},
    '4' => {:id => '4', :name => 'orph', :type => 'copyright', :description => 'copyright-orphaned (implies in-copyright)'},
    '5' => {:id => '5', :name => 'und', :type => 'copyright', :description => 'undetermined copyright stat'},
    '6' => {:id => '6', :name => 'umall', :type => 'access', :description => 'available to UM affiliates and walk-in patrons (all campuses)'},
    '7' => {:id => '7', :name => 'world', :type => 'access', :description => 'available to everyone in the world'},
    '8' => {:id => '8', :name => 'nobody', :type => 'nobody', :description => 'available to nobody; blocked for all users'},
    '9' => {:id => '9', :name => 'pdus', :type => 'copyright', :description => 'public domain only when viewed in the US'},
    '10' => {:id => '10', :name => 'cc-by', :type => 'copyright', :description => 'Creative Commons Attribution license'},
    '11' => {:id => '11', :name => 'cc-by-nd', :type => 'copyright', :description => 'Creative Commons Attribution-NoDerivatives license'},
    '12' => {:id => '12', :name => 'cc-by-nc-nd', :type => 'copyright', :description => 'Creative Commons Attribution-NonCommercial-NoDerivatives license'},
    '13' => {:id => '13', :name => 'cc-by-nc', :type => 'copyright', :description => 'Creative Commons Attribution-NonCommercial license'},
    '14' => {:id => '14', :name => 'cc-by-nc-sa', :type => 'copyright', :description => 'Creative Commons Attribution-NonCommercial-ShareAlike license'},
    '15' => {:id => '15', :name => 'cc-by-sa', :type => 'copyright', :description => 'Creative Commons Attribution-ShareAlike license'},   
    '16' => {:id => '15', :name => 'copyright', :type => 'orphcand', :description => 'orphan candidate - in 90-day holding period (implies in-copyright)'},
    '17' => {:id => '17', :name => 'copyright', :type => 'cc-zero', :description => 'Creative Commons Zero license (implies pd)'},
    '18' => {:id => '18', :name => 'access', :type => 'und-world', :description => 'undetermined copyright status and permitted as world viewable by the depositor'},
    '19' => {:id => '19', :name => 'copyright', :type => 'icus', :description => 'in copyright in the US'}
  }

  
  def initialize(rights)
    @raw = rights
    @note = rights["htd:note"]
    @user = rights["htd:user"]
    @time = rights["htd:time"]
    @namespace = rights["htd:namespace"]
    @source = SOURCE[rights["htd:source"]]
    @attribute = ATTRIBUTES[rights["htd:attr"]]
    @id = rights["htd:id"]
    @reason = REASON[rights["htd:reason"]]          
  end
  
end
