using NbaManagement.Database;
using System.Collections.Generic;

namespace NbaManagement.ViewModels
{
    public class PlayerPositionViewModel
    {
        public string PositionName { get; }

        public IEnumerable<Player> Players { get; }

        public PlayerPositionViewModel(string positionName, IEnumerable<Player> players)
        {
            PositionName = positionName;
            Players = players;
        }
    }
}