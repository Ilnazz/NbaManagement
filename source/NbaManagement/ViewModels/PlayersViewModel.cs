using System.Collections.Generic;
using NbaManagement.Database;
using NbaManagement.Mvvm.Navigation;
using NbaManagement.Services;
using NbaManagement.ViewModels.Base;

namespace NbaManagement.ViewModels
{
    public class PlayersViewModel : NavigatableTitledViewModel
    {
        public IEnumerable<Player> Players { get; }
        
        private readonly PlayerService _playerService;
        
        public PlayersViewModel(INavigationService navigationService, PlayerService playerService) : base(navigationService)
        {
            _playerService = playerService;
            
            Title = "Players Main";

            Players = _playerService.GetPlayers();
        }
    }
}