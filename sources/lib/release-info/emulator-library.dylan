Module:    Dylan-User
Synopsis:  Functional Developer Emulator release information
Author:    Andy Armstrong
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      Functional Objects Library Public License Version 1.0
Dual-license: GNU Lesser General Public License
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define library emulator-release-info
  use functional-dylan;
  use system;
  use release-info, export: all;
end library emulator-release-info;