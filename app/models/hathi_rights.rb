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
  '11' => {:id => '11', :name => 'unp', :description => 'unpublished work'}
  }
  
  SOURCE = {
  '1' => {:id => '1', :name => 'google', :description => 'Google'},
  '2' => {:id => '2', :name => 'lit-dlps-dc', :description => 'Library IT, Digital Library Production Service, Digital Conversion'}
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
    '9' => {:id => '9', :name => 'pdus', :type => 'copyright', :description => 'public domain only when viewed in the US'}
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
