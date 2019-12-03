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

class zc_Counter
{

// public: /////////////////////////////////////////////////////////////////////

  zc_Counter init(int playerNumber)
  {
    _player         = players[playerNumber];
    _oldSecretCount = 0;
    return self;
  }

  play
  void countDamage(int damage, Actor inflictor)
  {
    if (isMe(inflictor))
    {
      addPoints(damage);
    }
  }

  play
  void countDeath(Actor died)
  {
    if (died && isMe(died.target))
    {
      addPoints(died.SpawnHealth() / 10);
    }
  }

  play
  void countSecrets()
  {
    int newSecretCount = _player.SecretCount;
    if (newSecretCount > _oldSecretCount)
    {
      addPoints(250);
      _oldSecretCount = newSecretCount;
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  bool isMe(Actor other)
  {
    return (other && other == _player.mo);
  }

  play
  void addPoints(int points)
  {
    _player.mo.score += points;
  }

// private: ////////////////////////////////////////////////////////////////////

  private PlayerInfo _player;
  private int        _oldSecretCount;

} // class zc_Counter