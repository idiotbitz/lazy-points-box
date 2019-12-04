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
 * This class is an entry point for Zcore.
 *
 * Scoring:
 *
 * 1. Damage: players get points for the amount of damage they inflict on monsters.
 * 2. Kills: players get points for 10% of killed monsters;
 * 3. Chain kills: 10 points for each monster killed in 3 seconds after previous kill.
 * 4. Secrets: finding a secret gives 250 points.
 * 5. Map items: collecting an item that counts for item counts gives 5 points.
 * 6. Barrels: destroying an explosive barrel gives 5 points.
 */
class zc_Dispatcher : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void OnRegister()
  {
    _timer      = new("zc_Timer"     ).init(TICKS_IN_SECOND * 3);
    _timerBonus = new("zc_TimerBonus").init(_timer);
    _counter    = new("zc_Counter"   ).init(consolePlayer, _timerBonus);
    _spawner    = new("zc_Spawner"   ).init();

    _view           = new("zc_View"          ).init();
    _timerView      = new("zc_TimerView"     ).init(_timer);
    _timerBonusView = new("zc_TimerBonusView").init(_timerBonus);
  }

  override
  void RenderOverlay(RenderEvent event)
  {
    _view.show();
    _timerView.show();
    _timerBonusView.show();
  }

  override
  void WorldThingDamaged(WorldEvent event)
  {
    _counter.countDamage(event.thing, event.damage, event.damageSource);
  }

  override
  void WorldThingDied(WorldEvent event)
  {
    _counter.countDeath(event.thing);
  }

  override
  void WorldTick()
  {
    _counter.countSecrets();
    _timer.update();
  }

  override
  void WorldThingSpawned(WorldEvent event)
  {
    _spawner.spawnScoreFor(event.thing);
  }

// private: ////////////////////////////////////////////////////////////////////

  const TICKS_IN_SECOND = 35;

// private: ////////////////////////////////////////////////////////////////////

  private zc_View           _view;
  private zc_Counter        _counter;
  private zc_Spawner        _spawner;
  private zc_Timer          _timer;
  private zc_TimerView      _timerView;
  private zc_TimerBonus     _timerBonus;
  private zc_TimerBonusView _timerBonusView;

} // class zc_Dispatcher
