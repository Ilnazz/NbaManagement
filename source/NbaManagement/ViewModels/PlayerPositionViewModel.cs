using NbaManagement.Database;
using System.Collections.Generic;
using System.Linq;

namespace NbaManagement.ViewModels
{
    public class PlayerPositionViewModel
    {
        public PlayerPosition Position { get; }

        public IEnumerable<Player> Players { get; }

        public PlayerPositionViewModel(PlayerPosition position, Team team)
        {
            Position = position;
            Players = team.Players.Where(player => player.Position == position);
        }
    }
}