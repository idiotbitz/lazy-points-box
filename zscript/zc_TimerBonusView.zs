/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
 *
 * This file is a part of Zcore.
 *
 * Zcore is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Zcore is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Zcore.  If not, see <https://www.gnu.org/licenses/>.
 */

class zc_TimerBonusView
{

// public: /////////////////////////////////////////////////////////////////////

  zc_TimerBonusView init(zc_TimerBonus timerBonus)
  {
    _timerBonus = timerBonus;

    return self;
  }

  ui
  void show()
  {
    console.printf("b: %d", _timerBonus.getBonus());
  }

// private: ////////////////////////////////////////////////////////////////////

  private zc_TimerBonus _timerBonus;

} // class zc_TimerBonusView
