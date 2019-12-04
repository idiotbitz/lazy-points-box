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

/**
 * This class counts down ticks.
 */
class zc_Timer
{

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Initializes an object.
   * @param count number of ticks to count.
   */
  zc_Timer init(int count)
  {
    _count        = count;
    _currentCount = 0;

    return self;
  }

  void update()
  {
    if (_currentCount)
    {
      --_currentCount;
    }
  }

  void reset()
  {
    _currentCount = _count;
  }

  int getCount() const
  {
    return _currentCount;
  }

// private: ////////////////////////////////////////////////////////////////////

  private int _count;
  private int _currentCount;

} // class zc_Timer
