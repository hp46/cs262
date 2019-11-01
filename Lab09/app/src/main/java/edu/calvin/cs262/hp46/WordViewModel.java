package edu.calvin.cs262.hp46;

import android.app.Application;

import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;

import java.util.List;


public class WordViewModel extends AndroidViewModel {

    private WordRespository mRepository;

    private LiveData<List<Word>> mAllWords;

    public WordViewModel (Application application) {
        super(application);
        mRepository = new WordRespository(application);
        mAllWords = mRepository.getAllWords();
    }

    LiveData<List<Word>> getAllWords() { return mAllWords; }

    public void insert(Word word) { mRepository.insert(word); }
    public void deleteAll() {mRepository.deleteAll();}
    public void deleteWord(Word word) {mRepository.deleteWord(word);}
}