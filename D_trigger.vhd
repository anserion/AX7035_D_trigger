--Copyright 2025 Andrey S. Ionisyan (anserion@gmail.com)
--Licensed under the Apache License, Version 2.0 (the "License");
--you may not use this file except in compliance with the License.
--You may obtain a copy of the License at
--    http://www.apache.org/licenses/LICENSE-2.0
--Unless required by applicable law or agreed to in writing, software
--distributed under the License is distributed on an "AS IS" BASIS,
--WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--See the License for the specific language governing permissions and
--limitations under the License.
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity D_trigger is
    Port (KEY1,KEY2: in STD_LOGIC;   -- D, C inputs
          LED1,LED2: out STD_LOGIC); -- Q, not(Q) outputs
end D_trigger;

architecture RTL of D_trigger is
component NAND2 port(I0,I1:in std_logic; O:out std_logic); end component;
signal p1,p2,Q,nQ:std_logic;
begin
DD1: NAND2 port map (KEY1,KEY2,p1);
DD2: NAND2 port map (p1,KEY2,p2);
DD3: NAND2 port map (p1,nQ,Q);
DD4: NAND2 port map (p2,Q,nQ);
LED1 <= Q;
LED2 <= nQ;
end RTL;
